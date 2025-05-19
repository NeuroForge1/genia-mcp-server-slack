FROM golang:1.19-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Copiar solo go.mod primero
COPY go.mod ./

# Ahora copiamos el resto del código
COPY . .

# Verificar la estructura de directorios
RUN ls -la

# Descargar dependencias (esto generará go.sum automáticamente)
RUN go mod download

# Compilar la aplicación simplificada (usando main.go en la raíz)
RUN go build -o slack-mcp-server main.go

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./slack-mcp-server"]
