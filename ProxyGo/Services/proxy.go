package proxy

import (
	"net/http"
	"io/ioutil"
)

func GetFromApi() string{
	url := "https://yh-finance.p.rapidapi.com/market/v2/get-summary?region=US"

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("X-RapidAPI-Host", "yh-finance.p.rapidapi.com")
	req.Header.Add("X-RapidAPI-Key", "7577f31a11msh3783cb72f22e241p120293jsn991a6ba7dfd8")

	res, _ := http.DefaultClient.Do(req)

	defer res.Body.Close()
	body, _ := ioutil.ReadAll(res.Body)
	stringBody := string(body)
	return stringBody
}