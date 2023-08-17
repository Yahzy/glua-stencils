--							| Made By Yahzy |
--				| https://github.com/Yahzy/glua-stencils |

module("stencil", package.seeall)

opened = false

function Start()
	if opened then
		debug.Trace()
		End()
		return
	end

	opened = true

	render.ClearStencil()
	render.SetStencilEnable(true)
	
	render.SetStencilWriteMask(1)
	render.SetStencilTestMask(1)
	
	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_ZERO)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_NEVER)
	render.SetStencilReferenceValue(1)
end

function Cut()
	render.SetStencilFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
	render.SetStencilZFailOperation(STENCILOPERATION_ZERO)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(1)
end

function Deny()
	render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilPassOperation(STENCILOPERATION_ZERO)
	render.SetStencilZFailOperation(STENCILOPERATION_REPLACE)
	render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
	render.SetStencilReferenceValue(0)
end

function End()
	opened = false
	render.SetStencilEnable(false)
	render.ClearStencil()
end

function Draw(mask, draw)
	Start()
	mask()
	Cut()
	draw()
	End()
end

--							| Made By Yahzy |
--				| https://github.com/Yahzy/glua-stencils |
