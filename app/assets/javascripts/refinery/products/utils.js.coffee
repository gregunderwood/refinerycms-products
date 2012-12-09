
window.namespace = (target, name, block) ->
  [target, name, block] = [(if typeof exports isnt 'undefined' then exports else window), arguments...] if arguments.length < 3
  top    = target
  target = target[item] or= {} for item in name.split '.'
  block target, top

window.using = (namespaces..., block) ->
  context = {}
  for ns in namespaces
    for k, v of ns
      if context[k]?
        throw "Unable to import namespace: symbol [#{k}] already imported!"
      context[k] = v
  block(context)

window.writeObj = (obj, message)->
  message = obj if not message 
  details = "*****************\n#{message}\n";
  fieldContents =
  for field, fieldContents of obj
    fieldContents = "(function)" if typeof(fieldContents) == "function" 
    details += "  #{field}:#{fieldContents}\n"
  details

if typeof String.prototype.startsWith != 'function' 
  String.prototype.startsWith = (str)->
    this.indexOf(str) == 0
 
