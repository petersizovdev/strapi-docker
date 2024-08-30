# Используем официальный образ Node.js
FROM node:18

# Устанавливаем рабочую директорию
WORKDIR /usr/src/app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальные файлы проекта
COPY . .

# Создаем приложение Strapi
RUN npm run build

# Открываем порт 1337
EXPOSE 1337

# Запускаем приложение
CMD ["npm", "run", "develop"]