local mode = TOOL.Mode

if SERVER then

	local flags = bit.bor( FCVAR_ARCHIVE, FCVAR_NOTIFY, FCVAR_REPLICATED )

	-- Create server console variables here.

	flags = nil

else

	local t = "tool." .. mode .. "."
	local function l( ... )
		local a = { ... }
		if #a < 2 then return end
		if #a < 3 then table.insert( a, 1, t ) end
		language.Add( a[1]..a[2], a[3] )
	end

	-- Tool's basic infos
	TOOL.Name		= l( "name" )
	TOOL.Category	= "Construction"

	l( "listname", "Tool" )
	l( "name", "Tool" )
	l( "desc", "Does stuff" )


	-- Tool's top left information
	TOOL.Information = {
		{ name = "0" },
	}

	l( "0", "Nothing to see here" )
	l( "left" )
	l( "right" )
	l( "reload" )


	-- Tool's client console variables
	TOOL.ClientConVar = {
	}


	t, l = nil, nil

end


local conVars = CLIENT and TOOL:BuildConVarList() or nil

function TOOL.BuildCPanel( cPanel )

	local t = "tool." .. mode .. "."
	local function l( ... )
		local a = { ... }
		if #a == 1 then table.insert( a, 1, t )
		elseif #a < 1 then return end
		return language.GetPhrase( a[1] .. a[2] )
	end
	
	cPanel:Help( l( "desc" ) )

	-- cPanel:ToolPresets( mode, conVars )

	t, l = nil, nil

end