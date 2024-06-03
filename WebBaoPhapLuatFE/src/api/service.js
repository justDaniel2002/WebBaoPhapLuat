import axios from 'axios'

export const getApi = async(url, params="") => {
    const result = await axios.get(`${url}${params}`)
    return result.data
}

export const postApi = async(url, data={}, params="" ) => {
    try {
        const result = await axios.post(`${url}${params}`, data)
        return result.data
    } catch (error) {
        console.log(error.message)
    }
}

export const delApi = async (url, params="") => {
    try {
        const result = await axios.delete(`${url}${params}`)
        return result.data
    } catch (error) {
        console.log(error.message)
    }
}

export const putApi = async(url, data={}, params="" ) => {
    try {
        const result = await axios.put(`${url}${params}`, data)
        return result.data
    } catch (error) {
        console.log(error.message)
    }
}
