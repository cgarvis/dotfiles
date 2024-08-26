local status, parrot = pcall(require, "parrot")
if (not status) then return end

parrot.setup {
  providers ={
    openai = {
      api_key = { "/usr/bin/security", "find-generic-password", "-s", "OPENAI_API_KEY", "-w" },
    },
    anthropic = {
      api_key = { "/usr/bin/security", "find-generic-password", "-s", "ANTHROPIC_KEY", "-w" },
    }
  }
}
