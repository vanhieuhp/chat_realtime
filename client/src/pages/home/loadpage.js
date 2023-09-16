import AtomicSpinner from 'atomic-spinner'

const LoadingPage = () =>{
    return (
        <div className="w-[100%] h-[100%] bg-violet-200 flex items-center justify-center">
            <AtomicSpinner className="z-10"/>
        </div>
    );
}

export default LoadingPage;