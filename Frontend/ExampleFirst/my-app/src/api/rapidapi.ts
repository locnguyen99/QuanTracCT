import myHttpClient from "./MyHttpClient"

class RapidApi {
    getCongTrinhs = async () => {
        const countries: any[] = await  myHttpClient.getAllCountry()
        return countries //gia trị là arry với type any
    }
}
// await là để đồng bộ, sau đó nó hổ trợ async
const rapidapi = new RapidApi()   //extend or tạo ra
export default rapidapi