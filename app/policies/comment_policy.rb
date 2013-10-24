class CommentPolicy < ApplicationPolicy
  attr_reader :user, :comment

  def initialize(user, comment)
    @user = user
    @comment = comment
  end

  def create?
    user.author? || user.editor? if user.present?
  end

  def publish?
    user.editor? if user.present?
  end

  alias_method :destroy?, :create?
  alias_method :approved?, :create?
  alias_method :update?, :create?

  def destroy?
   comment.authored_by?(user) || user.editor? if user.present?
 end

  Scope = Struct.new(:user, :scope) do
    def resolve
      if user.present? && user.editor? && user.author?
        scope.all
      else
        scope.where(:approved => true)
      end
    end
  end
end
