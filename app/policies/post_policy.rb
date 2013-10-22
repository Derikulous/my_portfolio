   class PostPolicy < ApplicationPolicy
    attr_reader :user, :post

    def initialize(user, post)
      @user = user
      @post = post
    end

    def create?
      if user.present?
        user.author? || user.editor?
      end
    end

    alias_method :update?, :create?

    def publish?
      if user.present?
        user.editor?
      end
    end

    def destroy?
      if user.present?
        return true if user.editor?
      end
    end

    PostPolicy = Struct.new(:user, :post) do
      Scope = Struct.new(:user, :scope) do
        def resolve
          if user.present? && user.editor?
            scope.all
          elsif user.present? && user.author?
            scope.where(:author_id => user.id) | scope.published
          else
            scope.where(:published => true)
          end
        end
      end
    end
