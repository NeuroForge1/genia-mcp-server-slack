FROM golang:1.19-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos del repositorio (que Render ya clonó)
COPY . .

# Verificar la estructura de directorios
RUN ls -la

# Compilar la aplicación simplificada (usando main.go en la raíz)
RUN go mod download && \
    go build -o slack-mcp-server main.go

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./slack-mcp-server"]
