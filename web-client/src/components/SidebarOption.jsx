function SideBarOption({ text, icon }) {
    
    const handleButtonClick = () => {
        document.querySelectorAll(".sidebar-button").forEach((button) => {
            button.classList.remove("selected");
        });

        event.currentTarget.classList.add("selected");
    };

    return (
        <button
            onClick={handleButtonClick}
            className="sidebar-button selected p-3.5 mt-3 bg-white rounded-lg flex flex-row w-full hover:bg-[#f0f0f0] active:bg-[#dadada]">

            <img src={icon} alt="Icon" className="h-[24px] mr-3.5" />
            
            <div className="font-medium text-slate-800">
                {text}
            </div>
        </button>
    )
} 

export default SideBarOption;