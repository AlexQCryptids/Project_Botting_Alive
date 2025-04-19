extends Text

func _ready() -> void:
	add_date("03/05/2025")
	# Mar 5th (8:16 pm) conversation with Mom (false = Mom, true = Callie)
	add_text("8:16 pm", false, "Cal it’s been so long since we had a proper family dinner.")
	add_text("8:16 pm", false, "So excited to have everyone together again!")
	add_text("8:16 pm", false, "Is Beth joining us too?")
	
	add_text("8:16 pm", true,  "hiiiii mom! Beth will be there")
	add_text("8:16 pm", true,  "You’re gonna be so surprised by how cool she is")
	add_text("8:16 pm", true,  "Want to take a guess at where she works?")
	
	add_text("8:16 pm", false, "No, don’t tell me!")
	add_text("8:16 pm", false, "I want it to be a surprise for tomorrow’s dinner.")
	
	add_text("8:16 pm", true,  "Of course! can’t wait to see your reaction")
	
	add_text("8:16 pm", false, "need Collin to pick you up?")
	
	add_text("8:16 pm", true,  "Mom I can drive! I got my driver license just a month ago!")
	
	add_text("8:16 pm", false, "Just be safe Cal (love emoji)")
	
	add_text("8:16 pm", true,  "I will! I’ll see you at 7!!! Love u mom!")
