-- scaffold geniefile for glew

glew_script = path.getabsolute(path.getdirectory(_SCRIPT))
glew_root = path.join(glew_script, "glew")

glew_includedirs = {
	path.join(glew_script, "config"),
	glew_root,
}

glew_libdirs = {}
glew_links = {}
glew_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { glew_includedirs }
	end,

	_add_defines = function()
		defines { glew_defines }
	end,

	_add_libdirs = function()
		libdirs { glew_libdirs }
	end,

	_add_external_links = function()
		links { glew_links }
	end,

	_add_self_links = function()
		links { "glew" }
	end,

	_create_projects = function()

project "glew"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		glew_includedirs,
	}

	defines {}

	files {
		path.join(glew_script, "config", "**.h"),
		path.join(glew_root, "**.h"),
		path.join(glew_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
