module ApplicationHelper

  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def disable_if_voted(post, vote_value)
    val = vote_value == :up ? 1 : -1
    if current_user.votes.find_by(post_id: post.id).try(:value) == val
      'disabled'
    end
  end

end
