FROM golang:1.19-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del repositorio (que Render ya clonó)
COPY . .

# Instalar dependencias y compilar la aplicación
RUN go mod download && \
    go build -o slack-mcp-server ./cmd/slack-mcp-server

# Exponer el puerto que utiliza la aplicación
EXPOSE 3001

# Comando para iniciar el servicio
CMD ["./slack-mcp-server", "--transport", "sse"]
