module IfDateTags::TagExtensions
  include Radiant::Taggable
  class TagError < StandardError; end
  
  desc %{
    Expands only if the date field specified in the @date@ attribute is earlier than the date specified in the @than@ attribute.
    
    If no @date@ attribute is passed, the current page's published_at or created_at will be used.
    *Usage:*

    <pre><code><r:if_date_earlier [date="published_at | created_at | updated_at"] than="August 1 2017" [or_equal="true"]>...</r:if_date_earlier></code></pre>
    
    An r:unless_date_earlier tag with the same attributes is also available
  }
  tag 'if_date_earlier' do |tag|
    than, date = than_and_date_from_attrs(tag)
    condition = tag.attr['or_equal'] ? "<=" : "<"
    tag.expand if date.send(condition, than)
  end
  tag 'unless_date_earlier' do |tag|
    than, date = than_and_date_from_attrs(tag)
    condition = tag.attr['or_equal'] ? "<=" : "<"
    tag.expand unless date.send(condition, than)
  end
  
  desc %{
    Expands only if the date field specified in the @date@ attribute is earlier than the date specified in the @than@ attribute.
    
    If no @date@ attribute is passed, the current page's published_at or created_at will be used.
    *Usage:*

    <pre><code><r:if_date_later [date="published_at | created_at | updated_at"] than="August 1 2017" [or_equal="true"]>...</r:if_date_later></code></pre>
    
    An r:unless_date_later tag with the same attributes is also available
  }
  tag 'if_date_later' do |tag|
    than, date = than_and_date_from_attrs(tag)
    condition = tag.attr['or_equal'] ? ">=" : ">"
    tag.expand if date.send(condition, than)
  end
  tag 'unless_date_later' do |tag|
    than, date = than_and_date_from_attrs(tag)
    condition = tag.attr['or_equal'] ? ">=" : ">"
    tag.expand unless date.send(condition, than)
  end
  
  def than_and_date_from_attrs(tag)
    raise TagError.new("`#{tag.name}' tag must contain a than attribute.") unless tag.attr['than']
    than = tag.attr['than']
    date_attr = tag.attr['date']
    date = if date_attr
      case
      when Page.date_column_names.include?(date_attr)
        tag.locals.page[date_attr].to_date
      else
        raise TagError, "Invalid value for 'date' attribute."
      end
    else
      tag.locals.page.published_at.to_date || tag.locals.page.created_at.to_date
    end.to_date.to_s.gsub('-','')
    
    than = DateTime.parse(than).to_date.to_s.gsub('-','')
    return [ than, date ]
  end
end
