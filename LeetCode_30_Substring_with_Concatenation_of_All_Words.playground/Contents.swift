/*
 LeetCode - Medium
 30. Substring with Concatenation of All Words
 
 runtime: 2536 ms, 100 % beats of swift submissions
 inspire:
 */


class Solution {
    func findSubstring(_ s: [Character], _ rec: [String: Int], _ len: Int, _ amount: Int) -> Bool {
        var recCopy = rec
        var i = 0
        
        while i < len * amount {
            let key = String(s[i..<i+len])
            if recCopy[key] != nil  {
                if recCopy[key] != 0 {
                    recCopy[key]! -= 1
                    i += len
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        if s.isEmpty || words.count == 0 {
            return []
        }
        
        if s.count < words.count * words[0].count {
            return []
        }
        
        let s = Array(s)
        let rec: [String: Int] = words.reduce(into: [:]) { $0[$1] = $0[$1] == nil ? 1 : $0[$1]! + 1 }
        let len = words[0].count
        let amount = words.count
        
        var result: Set<Int> = []
        for i in 0...s.count - len * amount {
            if findSubstring(Array(s[i...]), rec, len, amount) {
                result.insert(i)
            }
        }
        
        return Array(result)
    }
}

Solution().findSubstring("ababaab", ["ab","ba","ba"])

Solution().findSubstring("xcsgedisbnkkiperkawetuiokxjmrapqcjyjpgbqulcecgxoitudpcrcccotcglhpjqeptwlhasjgpaqlutaznebptwszhbostvhmtvtunfcehtpboscbwdrpzlqgohahcivxfpruwuydpqgdijhgmaymloubxvizfdxkuqeqmetduajejqnxqlldbgezdoaitzuosagegakdcthnjwmzjyeleimjyotrqphipooxqyasrihagtbqthdzppipfbhvqodheufushomrvmyrqokxrkpiuepwnloeqyikfdfmrrepfcgvqsvjektbqixetnkmlsyqxddpwhgclozdgumnghoxpndlapxohvghbjyxsebfsbiaxwnedddvsggvxdjgapnbblbvpcbhdjibixhlbkgtsooptzvurlxswynmdoviafjidsvgcebwsslmrjiiufcsgqgjgcrghdomvmuaqwwkokwhvgsrmujskqbruszdxqqtckvuirewddgyjypxszpdrswlnvoklefprajzsqyxtewecncuorzfmvqztfjglrwcrfelxcjqghvkuzgjsgoedfdwmpdxgbcxiglgiuyqdtaxuginoxrsevqsmvpuwrrhxenhalxdhzbbilqwiiqofjgrewldpemplzwlmupvvsxddncoxsccdlvkjinypbnaamloiakdujhyylmwdqajbwtkgijvjyvlkhzsjlyeufctsorvergipzswhdrqcpbowdjfohjjonegdvdkoksejkcrovjsklgiorqeybnmprusoyedkwjthnmxkwpxjxfzpvdpxtcokyibwnggjrcseopqmgnvgtuvqamntqbfpmgnzowifydloscdbpyhkvebvqqqhuvwgclfshpyfsjwnnzodzxpudqrtjhcddajhmqztfzbajxnywddxatsdllyuvbzabkjnaihikiivhvtfyxcaswfdidafebfimovoyeyioidvfzadwffqbkvlovquzvcnjydkecstkyoqxrvvwdlznildebyfzasiavufznamnqcmhzhfcufscsvitvpswhdyfxdemfqbwundwwlaqsuvkqffnvalcfkjepotvgurdiwzehbxbwsnozvbuvnzcxigmyzjfuaicxjigkfkgzxuzuytplutkdaybbiixisbhdkqopawrztqurlleghojhmmkuxifrjovtellghcicsetfrxlylwhalsuiczblqwhuhsdpwlrqpnvimhhafoaqiuakwcwmyfiizlzvyqlpfiysrfsxvsneoqomsmasrjaqwznvsakzjiraplxlfnrwdfixujpluseqtrlluyldiedasdlxscvvjeudplrjdxbxqpkkpxpxctxuyktqornyxhdmuwxytaxmphwefoejhbfhmazarmaovecpczpwcokrwiydwcofftmttlwnzwbwceoffddhsnbqxzvubjzieocxbymduozzungztjjlykdxlarojtwpjyokwbntppujcakvlvilfniqnceyvdnebcqadgtuvpfzppxanhlsvvlkxrjuuyywarwdzrzwgevxwuzjemdzholfgwzcvayvtwbspaoxhlwdivmmhpnpgywovxqqzrnsnqmfrceaobdywrkeixvovrcsqtkqkyizovghxljnmmlkfvqoulesehkvcxlo"
,["dbpyhkvebvqqqhuvwgclfshpyfs","jwnnzodzxpudqrtjhcddajhmqzt","fzbajxnywddxatsdllyuvbzabkj","naihikiivhvtfyxcaswfdidafeb","fimovoyeyioidvfzadwffqbkvlo","vquzvcnjydkecstkyoqxrvvwdlz","nildebyfzasiavufznamnqcmhzh","fcufscsvitvpswhdyfxdemfqbwu","ndwwlaqsuvkqffnvalcfkjepotv","gurdiwzehbxbwsnozvbuvnzcxig","myzjfuaicxjigkfkgzxuzuytplu","tkdaybbiixisbhdkqopawrztqur","lleghojhmmkuxifrjovtellghci","csetfrxlylwhalsuiczblqwhuhs","dpwlrqpnvimhhafoaqiuakwcwmy","fiizlzvyqlpfiysrfsxvsneoqom","smasrjaqwznvsakzjiraplxlfnr","wdfixujpluseqtrlluyldiedasd","lxscvvjeudplrjdxbxqpkkpxpxc","txuyktqornyxhdmuwxytaxmphwe","foejhbfhmazarmaovecpczpwcok","rwiydwcofftmttlwnzwbwceoffd","dhsnbqxzvubjzieocxbymduozzu","ngztjjlykdxlarojtwpjyokwbnt","ppujcakvlvilfniqnceyvdnebcq"])


