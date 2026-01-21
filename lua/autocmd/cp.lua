local ft_group = vim.api.nvim_create_augroup("CP_Cmd", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.c", "*.cpp" },
	group = ft_group,
	callback = function(ev)
		if string.match(ev.file, "tle") or string.match(ev.file, "codechef") then
			if vim.api.nvim_buf_line_count(ev.buf) == 1 then
				vim.api.nvim_buf_set_lines(ev.buf, 0, 0, false, {
					"#include<iostream>",
					"",
					"typedef long long int ll;",
					"",
					"int main() {",
					"	ll t;",
					"	std::cin>>t;",
					"	",
					"	while(t--){",
					"	}",
					"}",
				})
			end
		end
	end,
})
