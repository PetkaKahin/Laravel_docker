import axios from 'axios'
import './echo'
import echo from '@/echo'

window.axios = axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

axios.interceptors.request.use((config) => {
    const socketId = echo.socketId()
    if (socketId) {
        config.headers['X-Socket-Id'] = socketId
    }
    return config
})
