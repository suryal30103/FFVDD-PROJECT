class counter_gen;

counter_trans trans;
mailbox gen2bfm;
event ended;
int repeat_count;

fucntion new(mailbox gen2bfm, event ended);
	this.gen2bfm = gen2bfm;
	this.ended = ended;
endfunction

task main;
	repeat(repeat_count) begin
		trans = neW();
		if(!trans.randomize()) $fatal ("Randomization Failed");
			gen2bfm.put(trans);
		end
		-> ended;
endtask
endclass