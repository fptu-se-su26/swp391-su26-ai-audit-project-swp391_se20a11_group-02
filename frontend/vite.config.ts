import { defineConfig, loadEnv } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig(({ mode }) => {
  // Load env variables based on the current mode (development, production)
  const env = loadEnv(mode, process.cwd(), '');
  
  return {
    plugins: [react()],
    define: {
      global: 'window',
    },
    base: env.VITE_BASE_PATH || '/',
    server: {
      port: 5173,
      strictPort: true,
      proxy: {
        '/nonstopcoding': {
          target: 'http://localhost:8080',
          changeOrigin: true,
          ws: true
        }
      }
    }
  }
})

