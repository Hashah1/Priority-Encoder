`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2018 07:08:19 PM
// Design Name: 
// Module Name: TB2_PRI_ENCODER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB2_PRI_ENCODER;
        parameter A_width = 8;
        //2^Y_width = A_width;
        parameter Y_width = 3;
        parameter Iterations = 1000;
        reg [A_width-1:0] in_tb;
        reg [A_width-1:0] temp_in;
        reg [A_width-1:0] temp_a;
        reg [A_width-1:0] in_tb_array [Iterations-1:0];
        reg [Y_width-1:0] out_ref_array [Iterations-1:0];
        reg valid_ref_array [Iterations-1:0];
        wire [Y_width-1:0] out_tb;
        wire valid_tb;
        // passing parameter values to the DUT
        casez1_module DUT
        (
        .A(in_tb),
        .Y(out_tb),
        .Valid(valid_tb));

        integer input_file;
        integer log_file;
        integer response_file;
        integer golden_file;
        integer ERROR_COUNT;
        integer CORRECT_COUNT;
        integer i, j, pos;
        //used in for-loops
        initial
        begin
          ERROR_COUNT=0;
          CORRECT_COUNT=0;
          // create input file
          input_file = $fopen("inputs.txt");
          $fwrite(input_file, "//input file\n");
          $fwrite(input_file, "//in_tb\t No.\n\n");
          // create response file
          response_file = $fopen("response.txt");
          $fwrite(response_file, "//response file\n");
          $fwrite(golden_file, "//iteration\tin_tb\t out_tb\tvalid_tb\n\n");
          // create golden file
          golden_file = $fopen("golden.txt");
          $fwrite(golden_file, "//input file\n");
          $fwrite(golden_file, "//iteration\tin_tb\t out_ref\tvalid_ref\n\n");
          // create log file
          log_file = $fopen("log.txt");
          Gen_Input (Iterations); //Generate stimulus and write it into input file
          Read_Stimuli; //Read test cases from input file
          Ref_Model(Iterations); //Determine reference outputs and store them in
          // golden file
          for (j = 0; j < Iterations; j = j + 1)
          begin
            in_tb = in_tb_array[j];
            #100
            $fwrite(response_file, "%d\t%b\t%b\t%b\n", i, in_tb, out_tb,
            valid_tb);
            Check_Output(out_ref_array[j], valid_ref_array[j]);
          end
          if (ERROR_COUNT == 0)
          begin
            $display("No errors or warnings");
            $fdisplay(log_file,"No errors or warnings");
          end
          else
          begin
            $display("%d errors found in simulation",ERROR_COUNT);
            $fdisplay(log_file,"%d errors found",ERROR_COUNT);
          end
          // close files
          $fclose(response_file);
          $fclose(golden_file);
          $fclose(log_file);
          $stop;
        end

        //generate random inputs and expected results
        task Gen_Input;
          input [31:0] times;
          begin
            for (i = 0; i < times; i = i + 1)
            begin
              temp_in = $random;
              $fwrite(input_file, "%b\t//%d\n", temp_in, i);
            end
          #100 $fclose(input_file);
          end
        endtask

        //read stimuli and store in in_tb_array
        task Read_Stimuli;
          $readmemb("inputs.txt", in_tb_array);
        endtask

        //construct reference model and generate expected results
        task Ref_Model;
          input [31:0] times;
          begin
            for (i = 0; i < times; i = i + 1)
            begin
              temp_a = in_tb_array[i];
              valid_ref_array[i] = 0;
              out_ref_array[i] = 'bX;
              for (pos = 0; pos < A_width; pos = pos + 1)
              begin
                if (temp_a[pos])
                begin
                  valid_ref_array[i] = 1;
                  out_ref_array[i] = pos;
                end
              end
              $fwrite(golden_file, "%d\t%b\t%b\t%b\n", i, in_tb_array [i], out_ref_array [i],
              valid_ref_array[i]);
            end
          end
        endtask

        //verify results
        task Check_Output;
          input [Y_width-1:0] EXPECTED_OUT;
          input EXPECTED_VALID;
          #0 begin
            if ( (EXPECTED_OUT !== out_tb) && (EXPECTED_VALID ==
            valid_tb) )
            begin
              $display("Error at time=%d ns actual=%b, expected=%b",
              $time, out_tb, EXPECTED_OUT);
              $fdisplay(log_file,"Error at time=%d ns actual=%b,expected=%b", $time, out_tb, EXPECTED_OUT);
              ERROR_COUNT = ERROR_COUNT + 1;
            end
            else
            begin
              CORRECT_COUNT = CORRECT_COUNT + 1;
            end
          end
        endtask
endmodule
