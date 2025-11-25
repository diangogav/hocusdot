# ============================================================================
# Ollama AI Integration
# ============================================================================

# Ensure Ollama service is running
if command -v ollama &>/dev/null; then
  # Check if service is running, start if not
  if ! pgrep -x "ollama" > /dev/null; then
    ollama serve &> /dev/null &
  fi
  
  # AI aliases
  alias ai='ollama run llama3'
  alias code-ai='ollama run codellama'
  alias ai-list='ollama list'
  alias ai-models='ollama list'
fi
