module ApplicationHelper
    def coderay(text)
        text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
          CodeRay.scan($3, $2).div(:css => :class)
        end
    end

    def decorate(model_name, decorator_class = nil)
      (decorator_class || "#{model_name.class}Decorator".constantize).new(model_name) 
    end 
end
