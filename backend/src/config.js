import dotenv from "dotenv";

dotenv.config();

const config = {
  tnt: {
    url: process.env.API_URL,
    username: process.env.API_USER,
    password: process.env.API_PASSWORD,
  },
  api: {
    port: process.env.API_PORT || 8888,
    baseUrl: process.env.API_BASE_URL || "http://localhost",
  },
  db: {
    user: process.env.MONGO_USER,
    pass: process.env.MONGO_PASSWORD,
    host: process.env.MONGO_HOST,
    name: "aurabus_db",
  },
};

export default config;
