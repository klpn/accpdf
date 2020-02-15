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
  return {pandoc.RawBlock("latex", "\\tagstructbegin{tag=L}"), pandoc.walk_block(el, {
    Plain = function(el)
      return { pandoc.RawBlock("latex",
        "\\tagstructbegin{tag=LI}\\tagstructbegin{tag=LBody}\\tagmcbegin{tag=P}"),
        el,
        pandoc.RawBlock("latex", "\\tagmcend\\tagstructend\\tagstructend")}
    end }),
   pandoc.RawBlock("latex", "\\tagstructend")}
end

if FORMAT:match "latex" then
  function Header(el)
    return tagBlock ("H" .. el.level, el)
  end
end
