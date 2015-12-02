local material = 0
local ribbon = 0

while true do
  local input = io.read() --read line
  if input == nil then
    break
  end

  local dimensions = {}
  input:gsub("%d+", function(i) table.insert(dimensions,tonumber(i)) end) --extract raw dimensions

  table.sort(dimensions)

  local areas = {
    dimensions[1]*dimensions[2],
    dimensions[2]*dimensions[3],
    dimensions[1]*dimensions[3]
  }

  -- areas[1] will the the smallest one
  material = material+areas[1]+2*(areas[1]+areas[2]+areas[3]) -- calculate total area

  --ribbon for wrapping
  ribbon = ribbon+2*(dimensions[1]+dimensions[2])

  --bow
  ribbon = ribbon+dimensions[1]*dimensions[2]*dimensions[3]
end

print("Material: ", material) --get rid of decimal points
print("Ribbon: ",ribbon)
