function populate_SC(shipID)
	local staticObj = {
		["name"] = "16temp Blocker Point S3", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "US NAVY - VS-24 CAG",
		["category"] = "Planes",
		["offsets"] =
		{
			["y"] = 34.469735879975,
			["angle"] = 6.0911990894602,
			["x"] = 67.739295549996,
		}, -- end of ["offsets"]
		["type"] = "S-3B",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Blocker Island Seahawk", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "US Navy - HS-5",
		["category"] = "Helicopters",
		["offsets"] =
		{
			["y"] = 15.023588829965,
			["angle"] = 6.0039326268605,
			["x"] = -44.319651074009,
		}, -- end of ["offsets"]
		["type"] = "UH-60A",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Blocker Island Hornet", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "VFA-31 Line NH",
		["category"] = "Planes",
		["offsets"] =
		{
			["y"] = 17.969597139978,
			["angle"] = 5.7595865315813,
			["x"] = -61.257363910001,
		}, -- end of ["offsets"]
		["type"] = "FA-18C_hornet",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Blocker Yunk Yard Tomcat", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "VF-31 Tomcatters AJ112 (2006)",
		["category"] = "Planes",
		["offsets"] =
		{
			["y"] = 20.798515920003,
			["angle"] = 5.7246799465414,
			["x"] = -78.309457666997,
		}, -- end of ["offsets"]
		["type"] = "F-14B",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	local staticObj = {

		["name"] = "16temp Finger Seahawk", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "US Navy - 01",
		["category"] = "Helicopters",
		["offsets"] =
		{
			["y"] = -25.023610410048,
			["angle"] = 1.7976891295542,
			["x"] = -120.511512843,
		}, -- end of ["offsets"]
		["type"] = "UH-60A",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Junk Yard Tug", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["offsets"] =
		{
			["y"] = 29.219321732642,
			["angle"] = 2.4958208303519,
			["x"] = -77.186823118536,
		}, -- end of ["offsets"]
		["type"] = "AS32-31A",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp LSO Station 3", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = -22.370473980031,
			["angle"] = 2.4434609527921,
			["x"] = -130.61201797701,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_lso_usa",
		["type"] = "Carrier LSO Personell",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp LSO Station 1", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = -21.789118479996,
			["angle"] = 4.2935099599061,
			["x"] = -129.42353100701,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_lso1_usa",
		["type"] = "Carrier LSO Personell 1",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp LSO Station 2", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "white",
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = -22.656188270019,
			["angle"] = 1.850049007114,
			["x"] = -129.497732263,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_tech_USA",
		["type"] = "us carrier tech",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Corral Tech 1", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "yellow",
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = 24.378384780779,
			["angle"] = 3.1764992386297,
			["x"] = -1.862423344297,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_tech_USA",
		["type"] = "us carrier tech",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************

	local staticObj = {

		["name"] = "16temp Corral Tech 2", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "yellow",
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = 24.943464248674,
			["angle"] = 5.218534463463,
			["x"] = -2.5415543022973,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_tech_USA",
		["type"] = "us carrier tech",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Yunk Yard Seaman", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = 30.850786532392,
			["angle"] = 4.7472955654246,
			["x"] = -76.189816852042,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_seaman_USA",
		["type"] = "Carrier Seaman",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Corral Tug", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["category"] = "ADEquipment",
		["offsets"] =
		{
			["y"] = 25.915128857188,
			["angle"] = 2.4958208303519,
			["x"] = -1.4404247678031,
		}, -- end of ["offsets"]
		["type"] = "AS32-31A",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp EL1 Tech 1", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "yellow",
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = 19.968042107823,
			["angle"] = 1.5707963267949,
			["x"] = 28.511725836535,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_tech_USA",
		["type"] = "us carrier tech",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Patio Firetruck", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["category"] = "ADEquipment",
		["offsets"] =
		{
			["y"] = 29.26265261037,
			["angle"] = 1.7453292519943,
			["x"] = -112.85393314034,
		}, -- end of ["offsets"]
		["type"] = "AS32-p25",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
	local staticObj = {

		["name"] = "16temp Patio Tech", -- unit name (Name this something identifiable if you wish to remove it later)
		-- Copy and paste over this with the units information
		["livery_id"] = "white",
		["category"] = "Personnel",
		["offsets"] =
		{
			["y"] = 26.2488428746,
			["angle"] = 3.700098014228,
			["x"] = -111.91510989917,
		}, -- end of ["offsets"]
		["shape_name"] = "carrier_tech_USA",
		["type"] = "us carrier tech",
		-- Copy and paste over this with the units information end

		-- these can be left as is, but is required.
		["groupId"] = 33,		-- id's of the unit we're spawning (will auto increment if id taken?)
		["unitId"] = 33,
		["y"] = -00127900,			-- The initial location of the unit (required else unit will offet on origin of map)
		["x"] = -00126557,
		["heading"] = 37.55948550292,
		["linkUnit"] = shipID, -- This value must be set Via 'shipID = #' where # is the id of the ship you wish to spawn on
		["linkOffset"] = true,
		["dead"] = false,
		["rate"] = 30,
	}
	coalition.addStaticObject(country.id.USA, staticObj)

	-- ********************************************************
end
