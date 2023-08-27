function HotelProjectionPage() {
    return (
        <div className="flex flex-col min-h-screen w-full p-5">

            
            
            <div className="w-full h-1/3 p-10 bg-gradient-to-br from-[#38BDF8] to-blue-500 rounded-xl shadow-lg font-bold text-5xl text-white flex justify-between items-center">

                <div>
                    Hello
                </div>

                <div>
                    $23,234
                </div>


            </div>


            <div className="flex items-center justify-evenly mt-10">
                <div className="font-bold text-3xl">
                    Nights
                </div>
                <input type="number" className="p-4 rounded-lg text-3xl font-bold w-[200px] text-center" />
                <input type="range" min={1} max={14} className="w-[250px]"/>
            </div>

            <div className="flex items-center justify-evenly mt-10">
                <div className="font-bold text-3xl">
                       Cost Per Night 
                </div>
                <input type="number" className="p-4 rounded-lg" />
                <input type="range" min={1} max={14} className="w-[250px]"/>
            </div>

            <div className="flex items-center justify-evenly mt-10">
                <div className="font-bold text-3xl">
                    Years
                </div>
                <input type="number" className="p-4 rounded-lg" />
                <input type="range" min={1} max={14} className="w-[250px]"/>
            </div>

            <div className="flex items-center justify-evenly mt-10">
                <div className="font-bold text-3xl">
                    Inflation
                </div>
                <input type="number" className="p-4 rounded-lg" />
                <input type="range" min={1} max={14} className="w-[250px]"/>
            </div>



        </div>
    )
}

export default HotelProjectionPage;