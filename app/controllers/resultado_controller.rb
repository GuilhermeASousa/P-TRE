class ResultadoController < ApplicationController

  def resultado
  	@here = 3
  	if session[:filtro_candidato] and session[:filtro_candidato] != ""
  		@filtroCand = session[:filtro_candidato].split(/,/)
  	end
  	@pontuationAlvo = UserPoint.where(handle: session[:handle]).map(&:pontuation)
    @ratingAlvo = UserPoint.where(handle: session[:handle]).map(&:rating)
  	@matriz = []
  	for i in 0...(@filtroCand.length - 1)
  		for j in (i+1)...(@filtroCand.length - 1)
  			@p1 = UserPoint.where(handle: @filtroCand[i]).map(&:pontuation)
  			@p2 = UserPoint.where(handle: @filtroCand[j]).map(&:pontuation)
  			@r1 = UserPoint.where(handle: @filtroCand[i]).map(&:rating)
  			@r2 = UserPoint.where(handle: @filtroCand[j]).map(&:rating)
  			@media = (@ratingAlvo[0] + @r1[0] + @r2[0]) / 3.00
  			@distancia = (@ratingAlvo[0] - @media).abs + (@r1[0] - @media).abs + (@r2[0] - @media).abs
  			@pontuationTot = (@pontuationAlvo[0] + @p1[0] + @p2[0]) / @distancia
  			@nomes = [session[:handle], @filtroCand[i], @filtroCand[j]]
  			@matriz.append([@pontuationTot,@nomes])
  		end
  	end
  	@resultado = @matriz.sort
  	@resultado = @resultado.reverse
    respond_to do |format| 
      if session[:handle1] and session[:handle1] != "" and session[:handle2] and session[:handle2] != "" and session[:handle3] and session[:handle3] != ""
      	format.json { render :json => montaJson(session[:handle1], session[:handle2], session[:handle3]) }
      end
      format.html
    end
  end

  def somatorio(total,value)
  	total = total + value
  	if value > 0
  		somatorio(total, value - 1)
  	else
  		return total
  	end
  end

  def montaJson(member1, member2, member3)
  	jsonMember1 = {}
  	jsonMember2 = {}
  	jsonMember3 = {}
  	jsonMember1["key"] = member1
  	jsonMember1["values"] = []
  	jsonMember2["key"] = member2
  	jsonMember2["values"] = []
  	jsonMember3["key"] = member3
  	jsonMember1["values"] = montaValues(member1)
  	jsonMember2["values"] = montaValues(member2)
  	jsonMember3["values"] = montaValues(member3)
  	json = [jsonMember1, jsonMember2, jsonMember3]
  	return json
  end

 def montaValues (member)
 	@member = UserCoverage.where(handle: member)
 	values1 = {}
 	values1["member"] = member
 	values1["axis"] = "fft"
  	values1["value"] = @member.map(&:fft)[0] 
  	values2 = {}
  	values2["member"] = member
 	values2["axis"] = "graphs"
  	values2["value"] = @member.map(&:graphs)[0] 
  	values3 = {}
  	values3["member"] = member
 	values3["axis"] = "implementation"
  	values3["value"] = @member.map(&:implementation)[0] 
  	values4 = {}
  	values4["member"] = member
 	values4["axis"] = "matrices"
  	values4["value"] = @member.map(&:matrices)[0] 
  	values5 = {}
  	values5["member"] = member
 	values5["axis"] = "dsu"
  	values5["value"] = @member.map(&:dsu)[0] 
  	values6 = {}
  	values6["member"] = member
 	values6["axis"] = "math"
  	values6["value"] = @member.map(&:math)[0] 
  	values7 = {}
  	values7["member"] = member
 	values7["axis"] = "combinatorics"
  	values7["value"] = @member.map(&:combinatorics)[0] 
  	values8 = {}
  	values8["member"] = member
 	values8["axis"] = "trees"
  	values8["value"] = @member.map(&:trees)[0] 
  	values9 = {}
  	values9["member"] = member
 	values9["axis"] = "greedy"
  	values9["value"] = @member.map(&:greedy)[0] 
  	values10 = {}
  	values10["member"] = member
 	values10["axis"] = "schedules"
  	values10["value"] = @member.map(&:schedules)[0] 
  	values11 = {}
  	values11["member"] = member
 	values11["axis"] = "flows"
  	values11["value"] = @member.map(&:flows)[0] 
  	values12 = {}
  	values12["member"] = member
 	values12["axis"] = "sortings"
  	values12["value"] = @member.map(&:sortings)[0] 
  	values13 = {}
  	values13["member"] = member
 	values13["axis"] = "dp"
  	values13["value"] = @member.map(&:dp)[0] 
  	values14 = {}
  	values14["member"] = member
 	values14["axis"] = "hashing"
  	values14["value"] = @member.map(&:hashing)[0] 
  	values15 = {}
  	values15["member"] = member
 	values15["axis"] = "bitmasks"
  	values15["value"] = @member.map(&:bitmasks)[0] 
  	values16 = {}
  	values16["member"] = member
 	values16["axis"] = "geometry"
  	values16["value"] = @member.map(&:geometry)[0] 
  	values17 = {}
  	values17["member"] = member
 	values17["axis"] = "probabilities"
  	values17["value"] = @member.map(&:probabilities)[0] 
  	values18 = {}
  	values18["member"] = member
 	values18["axis"] = "games"
  	values18["value"] = @member.map(&:games)[0] 
  	values19 = {}
  	values19["member"] = member
 	values19["axis"] = "strings"
  	values19["value"] = @member.map(&:strings)[0] 
  	values20 = {}
  	values20["member"] = member
 	values20["axis"] = "shortest paths"
  	values20["value"] = @member.map(&:shortest_paths)[0] 
  	values21 = {}
  	values21["member"] = member
 	values21["axis"] = "constructive algorithms"
  	values21["value"] = @member.map(&:constructive_algorithms)[0] 
  	values22 = {}
  	values22["member"] = member
 	values22["axis"] = "divide and conquer"
  	values22["value"] = @member.map(&:divide_and_conquer)[0] 
  	values23 = {}
  	values23["member"] = member
 	values23["axis"] = "dfs and similar"
  	values23["value"] = @member.map(&:dfs_and_similar)[0] 
  	values24 = {}
  	values24["member"] = member
 	values24["axis"] = "graph matchings"
  	values24["value"] = @member.map(&:graph_matchings)[0] 
  	values25 = {}
  	values25["member"] = member
 	values25["axis"] = "string suffix structures"
  	values25["value"] = @member.map(&:string_suffix_structures)[0] 
  	values26 = {}
  	values26["member"] = member
 	values26["axis"] = "meet in the middle"
  	values26["value"] = @member.map(&:meet_in_the_middle)[0] 
  	values27 = {}
  	values27["member"] = member
 	values27["axis"] = "data structures"
  	values27["value"] = @member.map(&:data_structures)[0] 
  	values28 = {}
  	values28["member"] = member
 	values28["axis"] = "expression parsing"
  	values28["value"] = @member.map(&:expression_parsing)[0] 
  	values29 = {}
  	values29["member"] = member
 	values29["axis"] = "number theory"
  	values29["value"] = @member.map(&:number_theory)[0] 
  	values30 = {}
  	values30["member"] = member
 	values30["axis"] = "brute force"
  	values30["value"] = @member.map(&:brute_force)[0] 
  	values31 = {}
  	values31["member"] = member
 	values31["axis"] = "ternary search"
  	values31["value"] = @member.map(&:ternary_search)[0] 
  	values32 = {}
  	values32["member"] = member
 	values32["axis"] = "binary search"
  	values32["value"] = @member.map(&:binary_search)[0] 
  	values33 = {}
  	values33["member"] = member
 	values33["axis"] = "chinese remainder theorem"
  	values33["value"] = @member.map(&:chinese_remainder_theorem)[0] 
  	values34 = {}
  	values34["member"] = member
 	values34["axis"] = "two pointers"
  	values34["value"] = @member.map(&:two_pointers)[0] 
  	values35 = {}
  	values35["member"] = member
 	values35["axis"] = "2-sat"
  	values35["value"] = @member.map(&:two_sat)[0] 
  	values = [values1, values2, values3, values4, values5, values6, values7, values8, values9, values10, values11, values12, values13, values14, values15, values16, values17, values18, values19, values20, values21, values22, values23, values24, values25, values26, values27, values28, values29, values30, values31, values32, values33, values34, values35]
  	return values
 end

 def geraVisualizacao
 	session[:handle1] = params[:handle1]
 	session[:handle2] = params[:handle2]
 	session[:handle3] = params[:handle3]
 	respond_to do |format|
      format.html {
        redirect_to "/resultado", status: :moved_permanently
      }
    end
 end

end
