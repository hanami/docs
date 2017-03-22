# frozen_string_literal: true
def init
  sections :header, [:method_signature, T('docstring'), :source]
end

def source
  return if owner != object.namespace
  return if Tags::OverloadTag === object
  return if object.source.nil?
  erb(:source)
end

def github_url(object)
  path = object.file.sub('gems/gems/', '')
  repo, project, link = path.split '-'
  line = object.line && "#L#{object.line}"

  "https://github.com/#{repo}/#{project}/blob/v#{link}#{line}"
end
