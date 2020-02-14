function tagBlock(label, el)
  return { pandoc.RawBlock("latex",
      "\\tagstructbegin{tag=" .. label .."}\\tagmcbegin{tag=" .. label .. "}"),
    el,
    pandoc.RawBlock("latex", "\\tagmcend\\tagstructend") }
end

function Para(el)
  return tagBlock("P", el)
end

function BulletList(el)
  return pandoc.walk_block(el, {
    Plain = function(el)
      return { pandoc.RawBlock("latex",
        "\\tagstructbegin{tag=LBody}\\tagmcbegin{tag=P}"),
        el,
        pandoc.RawBlock("latex", "\\tagmcend\\tagstructend\\tagstructend") }
    end })
end
