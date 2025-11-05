return function(k)
  if k == 'local' then
    return function (k)
      return function (v) vim.opt_local[k] = v end
    end
  else
    return function(v) vim.opt[k] = v end
  end
end

