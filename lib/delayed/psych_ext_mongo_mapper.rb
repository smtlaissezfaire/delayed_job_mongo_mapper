module Psych
  module Visitors
    class ToRuby
      def visit_Psych_Nodes_Mapping_with_klass(object)
        return revive(Psych.load_tags[object.tag], object) if Psych.load_tags[object.tag]

        case object.tag
        when /^!ruby\/MongoMapper:(.+)$/
          klass = resolve_class($1)
          payload = Hash[*object.children.map { |c| accept c }]
          begin
            klass.find!(payload["attributes"]["_id"])
          rescue MongoMapper::DocumentNotFound
            raise Delayed::DeserializationError
          end
        else
          visit_Psych_Nodes_Mapping_without_klass(object)
        end
      end

      # def self.alias_method_chain(target, feature)
      #   # Strip out punctuation on predicates or bang methods since
      #   # e.g. target?_without_feature is not a valid method name.
      #   aliased_target, punctuation = target.to_s.sub(/([?!=])$/, ''), $1
      #   yield(aliased_target, punctuation) if block_given?
      #
      #   with_method, without_method = "#{aliased_target}_with_#{feature}#{punctuation}", "#{aliased_target}_without_#{feature}#{punctuation}"
      #
      #   alias_method without_method, target
      #   alias_method target, with_method
      #
      #   case
      #     when public_method_defined?(without_method)
      #       public target
      #     when protected_method_defined?(without_method)
      #       protected target
      #     when private_method_defined?(without_method)
      #       private target
      #   end
      # end
      #
      # alias_method_chain :visit_Psych_Nodes_Mapping, :klass

      alias_method :visit_Psych_Nodes_Mapping_without_klass, :visit_Psych_Nodes_Mapping
      alias_method :visit_Psych_Nodes_Mapping, :visit_Psych_Nodes_Mapping_with_klass
    end
  end
end
