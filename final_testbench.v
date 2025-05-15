module main_testbench ();
    
    reg clk=1'b1,rst;

    Single_top  Single_top(
            .clk(clk),
            .rst(rst)
    );

    initial begin
        $dumpfile("aafnai_comp.vcd");
        $dumpvars(0);
    end

    always 
    begin
        clk = ~ clk;
        #50;  
        
    end
    
    initial
    begin
        rst <= 1'b0;
        #150;

        rst <=1'b1;
        #1000;
        $finish;
    end
endmodule