_ = require 'lodash'
_fs = require 'fs'
_selector = require './selector'



###
  json:
    {
      "selector":{
        hover:{
          ....
        },
        style:{
          "xxx": xxx
          "xxx": xxx
          ...
        },
        id: true
      }，
      ...
      "selector": ...
    }

    selector 为标准选择器， 如果id为true, 那么选择器将添加 '#'转成id 选择器
###

parseJsonToString = (obj)->

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
    queue.push("#{key}:#{value}")
  "#{selector}{#{queue.join(";")};}"

parseSimpleJSON = (obj)->
  queue = []
  queue.push(parse(key, value)) for key, value of obj
  queue.join('\n')

parseSimpleJSONToFile = (obj, filePath)->
  style = parseJsonToString(obj)
  _fs.writeFileSync(filePath, style)

###

###

exports.parseSimpleJSON = parseSimpleJSON
exports.parseSimpleJSONToFile = parseSimpleJSONToFile

