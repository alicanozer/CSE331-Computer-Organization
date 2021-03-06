module test_top;
	wire [31:0] result;	
	parameter numOfInstruction = 26;
	parameter delayTime= numOfInstruction * 50;

	ozer_alican_bonus topModul(result);
		
	initial begin
	//dosyadan okuma
		$readmemh("rMem.txt", topModul.REG.RMEM);
		$readmemb("iMem.txt", topModul.IM.IMEM);
		$readmemh("dMem.txt", topModul.DATAMEM.DMEM);
		//ilk degerleri dosyaya yazma
		$writememh("initial_rMem.txt", topModul.REG.RMEM);
		$writememb("initial_iMem.txt", topModul.IM.IMEM);
		$writememh("initial_dMem.txt", topModul.DATAMEM.DMEM);
		//instructionlarin bitmesi icin gereken zaman
	end
	always begin
		if(topModul.PC.PCreg > numOfInstruction*4)
		begin
			//son degerleri dosyaya yazma
			$writememh("result_rMem.txt", topModul.REG.RMEM);
			$writememb("result_iMem.txt", topModul.IM.IMEM);
			$writememh("result_dMem.txt", topModul.DATAMEM.DMEM);
			#50;
			$finish;
		end
		#50;
	end
endmodule


