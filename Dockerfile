FROM golang:1.19-alpine

# Establecer directorio de trabajo
WORKDIR /app

# Primero copiamos solo go.mod y go.sum para aprovechar la caché de Docker
COPY go.mod go.sum ./

# Descargar dependencias (esto se ejecutará solo si go.mod o go.sum cambian)
RUN go mod download

# Ahora copiamos el resto del código
COPY . .

# Verificar la estructura de directorios
RUN ls -la

# Compilar la aplicación simplificada (usando main.go en la raíz)
RUN go build -o slack-mcp-server main.go

# Exponer el puerto que utiliza la aplicación
EXPOSE 8000

# Comando para iniciar el servicio
CMD ["./slack-mcp-server"]
