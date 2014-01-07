class PostPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def create?
    user.admin? if user.present?
  end

  alias_method :destroy?, :create?
  alias_method :update?, :create?

  def publish?
    user.admin? if user.present?
  end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.admin?
        scope.all
      elsif user.present?
        scope.where(:author_id => user.id) | scope.published
      else
        scope.where(:published => true)
      end
    end
  end
end
