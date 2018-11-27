event: ["file_requested"]
priority: 1
input_parameters: ["request"]

local dir = torchbear.settings.files_path or "files"
local path = dir .. "/" .. request.query.file
local file_content = fs.read_file(path)

if not file_content then
  log.error("Could not open file " .. path)
  return {
    status = 404,
    headers = {},
    body = ""
  }
end

return {
  status = 200,
  headers = {
    -- TODO: Get content type from file
    ["content-type"] = "application/octet-stream",
  },
  body = file_content
}
