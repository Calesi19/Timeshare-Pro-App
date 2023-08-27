import Logo from '../assets/logo.png';
import SideBarOption from './SidebarOption';
import SideBarDivider from './SideBarDivider';
import BedIcon from '../assets/bed.svg';
import PizzaIcon from '../assets/pizza.svg';
import WriteIcon from '../assets/write.svg';
import CalculatorIcon from '../assets/calculator.svg';
import CurrencyIcon from '../assets/money.svg';
import InformationIcon from '../assets/information.svg';
import TranslateIcon from '../assets/translate.svg';
import ReloadIcon from '../assets/reload.svg';

function SideBar() {
    return (
        <div className="bg-white min-h-screen w-[350px] p-4 flex flex-col justify-between">
            
            
            <div>

            <img alt="logo" src={ Logo } className="rounded-xl w-[50px] aspect-square ml-2.5" />
            <SideBarDivider text={ "Presentation" } />
            <SideBarOption text={"Hotel Cost Projections"} icon={BedIcon} />
            <SideBarOption text={"Fun Activity Calculator"} icon={PizzaIcon} />

            <SideBarDivider text={ "Backend" } />
            <SideBarOption text={"Proposal"} icon={WriteIcon} />
            <SideBarOption text={"Calculator"} icon={CalculatorIcon} />
            <SideBarOption text={"Currency Converter"} icon={CurrencyIcon} />

            </div>
            
            <div>
            <SideBarOption text={"Reset Everything"} icon={ReloadIcon} />
            <SideBarOption text={"Language"} icon={TranslateIcon} />
            <SideBarOption text={"About"} icon={InformationIcon} />
            </div>


        </div>
    );

}



export default SideBar;