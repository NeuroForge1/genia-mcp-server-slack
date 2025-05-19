FROM golang:1.19-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo el código fuente necesario
COPY main.go ./

# Verificar la estructura de directorios
RUN ls -la

# Crear un go.mod mínimo desde dentro del Dockerfile
RUN go mod init github.com/NeuroForge1/genia-mcp-server-slack && \
    go mod tidy

# Verificar que go.mod se ha creado correctamente
RUN ls -la

# Compilar la aplicación simplificada
RUN go build -o slack-mcp-server main.go

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./slack-mcp-server"]
