_ = require 'lodash'
_fs = require 'fs'
_selector = require './selector'

###
  @params {string} 选择器
    标准选择器则按标准抽取，否则认为是id选择器（自动在前面加#）
  @params {object} css样式
###
parse = (selector, cssObj)->
  if not _selector.isStandardSelector(selector)
    selector = "##{selector}"
  queue = []
  for key, value of cssObj
    value = "#{value}px" if _.isNumber(value)
    continue if not value #值为空时忽略该属性
    if key is 'background-image'
      value = "url(#{value})" if not /url\(.*\)/.test(value)
    queue.push("#{key}:#{value}")
  "#{selector}{#{queue.join(";")};}"

parseSimpleJSON = (obj)->
  queue = []
  queue.push(parse(key, value)) for key, value of obj
  queue.join('\n')

###
  抽取样式到文件
###
parseSimpleJSONToFile = (obj, filePath)->
  style = parseSimpleJSON(obj)
  _fs.writeFileSync(filePath, style)

exports.parse = parse
exports.parseSimpleJSON = parseSimpleJSON
exports.parseSimpleJSONToFile = parseSimpleJSONToFile

