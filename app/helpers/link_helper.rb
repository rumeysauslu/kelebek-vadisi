# frozen_string_literal: true

module LinkHelper
  def link_to_chstate(path = nil, text = t('action_group.back'), state = true, remote = true, method = :post)
    elems = state ? { btn: 'danger', fa: 'times', title: 'Yayından Kaldır' } : { btn: 'primary', fa: 'thumbs-up', title: 'Yayına Al' }
    link_to(
      icon('fa', elems[:fa], text),
      path,
      class: "btn btn-#{elems[:btn]} btn-sm",
      remote: remote,
      title: elems[:title],
      method: method
    )
  end

  def link_to_back(path = nil, text = t('action_group.back'))
    link_to(
      icon('fa', 'arrow-left', text),
      path,
      class: 'btn btn-secondary btn-sm'
    )
  end

  def link_to_destroy(path = nil, text = t('action_group.destroy'))
    link_to(
      icon('fa', 'trash', text),
      path,
      method: :delete,
      data: { confirm: t('are_you_sure') },
      class: 'btn btn-danger btn-sm'
    )
  end

  def link_to_edit(path = nil, text = t('action_group.edit'))
    link_to(
      icon('fa', 'edit', text),
      path,
      class: 'btn btn-warning btn-sm'
    )
  end

  def link_to_new(path = nil, text = t('action_group.add'))
    link_to(
      icon('fa', 'plus', text),
      path,
      class: 'btn btn-primary btn-sm',
      id: 'add-button'
    )
  end

  def link_to_show(path = nil, text = t('action_group.show'))
    link_to(
      icon('fa', 'eye', text),
      path,
      class: 'btn btn-info btn-sm'
    )
  end

  def link_to_update(path = nil, text = t('action_group.update'))
    link_to(
      icon('fa', 'pencil-square-o', text),
      path,
      class: 'btn btn-info btn-sm'
    )
  end

  def link_to_file(path = nil, text = t('action_group.file'))
    link_to(
      icon('fa', 'file-word-o', text),
      path,
      class: 'btn btn-secondary btn-sm'
    )
  end
end
