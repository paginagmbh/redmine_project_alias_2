module AliasStringHTMLSafePatch

    def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
            unloadable
        end
    end

    module InstanceMethods

        def html_safe
            self
        end

    end

end
