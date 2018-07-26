package net.slipp.di;

public class MessageRenderer {
	private MessageProvider messageProvider;
	
	public void setMessageProvider(MessageProvider messageProvider) {
		this.messageProvider = messageProvider;
	}
	
	public void render() {
		System.out.println(messageProvider.getMessage());
	}
	public static void main(String[] args) {
		MessageRenderer renderer = new MessageRenderer();
		renderer.setMessageProvider(new HelloWorldMessageProvider());
		renderer.render();
		
		renderer.setMessageProvider(new HiWorldMessageProvider());
		renderer.render();
	}
	
}
