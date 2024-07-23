-- CSC querying, highlight support
return {
	"cameron-wags/rainbow_csv.nvim",
	config = true,
	lazy = true,
	ft = {
		'csv',
		'tsv',
		'csv_semicolon',
		'csv_whitespace',
		'csv_pipe',
		'rfc_csv',
		'rfc_semicolon'
	},
	cmd = {
		'RainbowDelim',
		'RainbowDelimSimple',
		'RainbowDelimQuoted',
		'RainbowMultiDelim'
	}
}
