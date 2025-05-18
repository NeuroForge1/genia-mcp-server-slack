# Slack MCP Server para GENIA

Un servidor MCP (Model Context Protocol) para Slack que permite a GENIA interactuar con canales, mensajes y otros recursos de Slack.

## Características

- Autenticación con tokens xoxc y xoxd de Slack
- Operaciones completas sobre canales y mensajes
- Soporte para mensajes directos y grupales
- Integración con el orquestador MCP de GENIA
- Soporte para autenticación por usuario

## Requisitos

- Node.js 16+
- NPX
- Tokens xoxc y xoxd de Slack con los permisos adecuados

## Instalación

### Usando NPX

```bash
npx slack-mcp-server@latest
```

### Ejecución

```bash
SLACK_XOXC_TOKEN=your_xoxc_token SLACK_XOXD_TOKEN=your_xoxd_token npx slack-mcp-server@latest
```

## Operaciones Soportadas

### Canales

- `get_channels`: Lista los canales disponibles
- `get_channel`: Obtiene información de un canal específico
- `join_channel`: Une al usuario a un canal
- `leave_channel`: Abandona un canal
- `create_channel`: Crea un nuevo canal

### Mensajes

- `post_message`: Envía un mensaje a un canal
- `get_messages`: Obtiene mensajes de un canal
- `update_message`: Edita un mensaje existente
- `delete_message`: Elimina un mensaje
- `react_to_message`: Añade una reacción a un mensaje

### Mensajes Directos

- `get_direct_messages`: Obtiene mensajes directos
- `send_direct_message`: Envía un mensaje directo a un usuario
- `get_direct_message_history`: Obtiene el historial de mensajes con un usuario

## Integración con GENIA

Este servidor MCP está diseñado para integrarse con el orquestador MCP de GENIA, permitiendo que los usuarios conecten sus propias cuentas de Slack y ejecuten operaciones a través de la interfaz unificada de GENIA.

### Ejemplo de Configuración en el Orquestador

```python
orchestrator.register_server(
    name="slack",
    command=["npx", "slack-mcp-server@latest"],
    env_vars={
        "SLACK_XOXC_TOKEN": "${SLACK_XOXC_TOKEN}",
        "SLACK_XOXD_TOKEN": "${SLACK_XOXD_TOKEN}"
    }
)
```

## Manejo de Errores

El servidor incluye manejo robusto de errores para:

- Tokens inválidos o expirados
- Permisos insuficientes
- Límites de API excedidos
- Recursos no encontrados
- Errores de formato en solicitudes

Cada error incluye un código específico y un mensaje descriptivo para facilitar la depuración.

## Verificación de Dependencias

El servidor verifica automáticamente todas las dependencias necesarias al iniciar:

- Versión de Node.js
- Disponibilidad de NPX
- Validez de los tokens
- Conectividad con la API de Slack

Si alguna dependencia falta o es incompatible, el servidor proporcionará instrucciones claras para resolverlo.

## Desarrollo

### Requisitos

- Node.js 16+
- npm o yarn

### Instalación de Dependencias

```bash
npm install
```

### Compilación

```bash
npm run build
```

### Pruebas

```bash
npm test
```

## Licencia

MIT

## Autor

GENIA Team
