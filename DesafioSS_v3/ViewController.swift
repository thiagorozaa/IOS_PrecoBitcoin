//
//  ViewController.swift
//  DesafioSS_v3
//
//  Created by Thiago Rosa Ataide on 28/01/20.
//  Copyright © 2020 Thiago Rosa Ataide. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UITableViewController {
    
    var tipoMoeda:[String] = []
    var infoMoeda:[String] = []
    //var tipoMoeda2:[String] = []
    //var infoMoedaBra:[String] = []
    //var infoMoedaEua:[String] = []
    //var infoMoedaEur:[String] = []
    //var infoMoedaAus:[String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        recuperarPrecoBitcoin()
        
        tipoMoeda = ["AUD - Dollar Astraliano", "BRL - Real", "EUR - Euro", "USD - Dollar"]
        
        print(infoMoeda)
        
        //tipoMoeda.append("real")
        //tipoMoeda.append("dollar")
        
        //infoMoeda.append("Valor do bitcoin em real é: R$ " + "variavel_valor" )
        //infoMoeda.append("Valor do bitcoin em dollar é: U$ " + "variavel_valor" )
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tipoMoeda.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        
        celula.textLabel?.text = tipoMoeda[indexPath.row]
        
        return celula
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //print(tipoMoeda[indexPath.row])
        
        let alertaController = UIAlertController(title: "Informações", message: infoMoeda[indexPath.row], preferredStyle: .alert)
        
        let acaoConfirmar = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertaController.addAction(acaoConfirmar)
    
        present(alertaController, animated: true, completion: nil)
        
        }
    
    func formatarPreco(preco:NSNumber) -> String{
        let nf = NumberFormatter()
        
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        
        if let precoFinal = nf.string(from: preco){
            return precoFinal
        }else{
            return "0,00"
        }
        
    }
    
    func recuperarPrecoBitcoin(){
        
        var info:String = ""
        
        if let url = URL(string: "https://blockchain.info/ticker"){
            let tarefa = URLSession.shared.dataTask(with: url) { (dados, requisicao, erro) in
                if erro == nil{
                    print("Sucesso!!!")
                    if let dadosRetorno = dados {
                        do{
                            if let objetoJson = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String:Any]{
    
                                
                                if let aud = objetoJson["AUD"] as? [String:Any]{
                                    //print("AUD")
                                    self.tipoMoeda.append("AUD - Dollar Astraliano")
                                    if let simbolo = aud["symbol"] as? String{
                                        //print(simbolo)
                                        //self.infoMoedaAus.append(simbolo)
                                        info = simbolo
                                    }
                                    if let preco = aud["buy"] as? Double{
                                        //print(preco)
                                        //self.infoMoedaAus.append(String(preco))
                                        info = info + " " + String(preco)
                                        //self.infoMoedaAus.append(info)
                                        //self.infoMoeda[1]=info
                                        self.infoMoeda.append(info)
                                        info = ""
                                    }
                                    
                                }
                                
                                
                                if let brl = objetoJson["BRL"] as? [String:Any]{
                                    //print("BRL")
                                    self.tipoMoeda.append("BRL - Real")
                                    if let simbolo = brl["symbol"] as? String{
                                        //print(simbolo)
                                        //self.infoMoedaBra.append(simbolo)
                                        info = simbolo
                                    }
                                    if let preco = brl["buy"] as? Double{
                                        //print(preco)
                                        //self.infoMoedaBra.append(String(preco))
                                        info = info + " " + String(preco)
                                        //self.infoMoedaBra.append(info)
                                        //self.infoMoeda[2]=info
                                        self.infoMoeda.append(info)
                                        info = ""
                                    }
                                    
                                }
                                
                                if let eur = objetoJson["EUR"] as? [String:Any]{
                                    //print("EUR")
                                    self.tipoMoeda.append("EUR - Euro")
                                    if let simbolo = eur["symbol"] as? String{
                                        //print(simbolo)
                                        //self.infoMoedaEur.append(simbolo)
                                        info = simbolo
                                    }
                                    if let preco = eur["buy"] as? Double{
                                        //print(preco)
                                        //self.infoMoedaEur.append(String(preco))
                                        info = info + " " + String(preco)
                                        //self.infoMoedaEur.append(info)
                                        //self.infoMoeda[3]=info
                                        self.infoMoeda.append(info)
                                        info = ""
                                    }
                                    
                                }
                                
                                if let usd = objetoJson["USD"] as? [String:Any]{
                                    //print("USD")
                                    self.tipoMoeda.append("USD - Dollar")
                                    if let simbolo = usd["symbol"] as? String{
                                        //print(simbolo)
                                        //self.infoMoedaEua.append(simbolo)
                                        info = simbolo
                                    }
                                    if let preco = usd["buy"] as? Double{
                                        //print(preco)
                                        //self.infoMoedaEua.append(String(preco))
                                        info = info + " " + String(preco)
                                        //self.infoMoedaEua.append(info)
                                        //self.infoMoeda[4]=info
                                        self.infoMoeda.append(info)
                                        info = ""
                                    }
                                    
                                }
                                
                                
                                
                                
                                
                                //Ordeçao do vetor de tipos de moeda - Etapa 2
                                self.tipoMoeda.sort()
                                print(self.tipoMoeda)
                                
                                DispatchQueue.main.async(execute: {
                                    print(self.tipoMoeda)
                                    
                                })
                            
                                /*DispatchQueue.main.async(execute: {
                                    self.precoBitcoin.text = "R$ " + precoFormatado
                                    self.botaoAtualizar.setTitle("Atualizar", for: .normal)
                                })*/
                            
                            }
                        }catch{
                            print("Erro ao formatar retorno")
                        }
                    }
                    
                    
                }else{
                    print("Falha")
                }
            }
            
            tarefa.resume()
        } /*fim if*/
        
        
    }

}

