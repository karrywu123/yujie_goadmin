package ip

import (
	"encoding/json"
	"io/ioutil"
	"net/http"
	"yujie_goadmin/app/yjgframe/utils/transcode"
)

func GetCityByIp(ip string) string {
	if ip == "" {
		return ""
	}

	if ip == "::1" || ip == "127.0.0.1" {
		return "内网IP"
	}

	url := "http://whois.pconline.com.cn/ipJson.jsp?json=true&ip=" + ip
	client := &http.Client{}
	request, _ := http.NewRequest("GET", url, nil)
	request.Header.Set("Accept-Charset", "GBK,utf-8;q=0.7,*;q=0.3")
	response, _ := client.Do(request)
	if response.StatusCode == 200 {
		body, _ := ioutil.ReadAll(response.Body)
		bodystr := string(body)
		tmp := transcode.ConvertToString(bodystr, "gbk", "utf-8")
		p := make(map[string]interface{}, 0)
		if err := json.Unmarshal([]byte(tmp), &p); err == nil {
			return p["city"].(string)
		}
	}
	return ""
}
