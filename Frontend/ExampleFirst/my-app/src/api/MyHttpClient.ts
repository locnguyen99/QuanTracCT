
interface ICongTrinhDTO { //khởi tạo cấu trúc công trình và nó sẽ gọi GET data theo cấu trúc này
    TenCT: string //name
    MaCT: string //alpha3Code
    DiaChi: string //subregion
}


class MyHttpClient {
    getAllCountry = () => {
        const apiUrl = 'https://restcountries-v1.p.rapidapi.com/all' //url thông qua get data
       
        const requestOptions = {
            method: 'GET',
            headers: {  //header for GET
                'Content-Type': 'application/json',
                'x-rapidapi-key': '978da46f1dmsh741cb9a2e404976p1d16b9jsn9d6591bdde43',
                'x-rapidapi-host': 'restcountries-v1.p.rapidapi.com'
            },
            // body: JSON.stringify({ title: 'React POST Request Example' })  
            // body for POST
        };

        return fetch(apiUrl,  requestOptions).then(async response => { // then cũng là một cách làm đồng bộ
            const countries: any[] = await response.json()
            const congTrinhs: ICongTrinhDTO[] = countries.map(country => {  //CongTrinhs với type là Interface (IcongTrinhDTO)
                return {                                                   //map CT vơi type ICongTrinhDTO
                    TenCT: country.name,
                    MaCT: country.alpha3Code,
                    DiaChi: country.subregion                             //return cấu trúc + key nó
                }
            })
            return congTrinhs
        })
    }
}

const myHttpClient = new MyHttpClient()
export default myHttpClient