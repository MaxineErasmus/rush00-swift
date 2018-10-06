import AppKit

struct Token: Codable {
	var access_token: String?
		var created_at: Int?
		var expires_in: Int?
		var scope: String?
		var token_type: String?
}

func getToken(){
	let uid = "3d4d1fa84b9f65c0fec81e6b265bea691a1a3ff6f3f2d51faa2e5437b424a2a3"
		let secret = "40cdae0dd1772267393ddb09dcfea9cb6b37b97e813450cb092e7849b3ce8b4e"

		guard let url = URL(string: "https://api.intra.42.fr/oauth/token") 
		else { 
			print("Error: Failed to set url")
				return 
		}

		let parameters = "grant_type=client_credentials&client_id=" + uid + "&client_secret=" + secret
			var request = URLRequest(url: url)
			request.httpMethod = "POST"
			request.httpBody = parameters.data(using: .utf8)

			let session = URLSession.shared
			session.dataTask(with: request) {
				(data, response, error) in
					guard let data = data else {
						print("Error: Failed to set data")
							return 
					}
				do {
					let token = try JSONDecoder().decode(Token.self, from: data)
						print("------------------------TOKEN-----------------------")
						print(token)
						print("------------------------TOKEN-----------------------")
				} catch {
					print("------------------------CATCH-----------------------")
				}
			}.resume()
}
